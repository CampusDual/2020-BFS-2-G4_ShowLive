import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommentService } from 'app/comment.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { UserComment } from 'app/concertComment';
import { CustomComment } from './customComment';
import { Concert } from 'app/concert';

@Component({
  selector: 'app-comments-section',
  templateUrl: './comments-section.component.html',
  styleUrls: ['./comments-section.component.scss']
})
export class CommentsSectionComponent implements OnInit {

  comments: Comment[];
  registerForm: FormGroup;
  submitted = false;
  concert_id: Number;


  constructor(private route: ActivatedRoute, private commentService: CommentService,
    private formBuilder: FormBuilder) { }


  ngOnInit() {
    let now = new Date();

    this.route.params.subscribe(data => {
      this.commentService.getComments(data).subscribe((result) => {
        this.comments = result && (result['data']) && (result['data'].length > 0) ? result['data'] : [];
      });
      this.concert_id = data.concert_id;
    });

    this.registerForm = this.formBuilder.group({
      NAME_COMMENT: ['', Validators.required],
      CONTENT: ['', Validators.required]
    });
  }

  get f() { return this.registerForm.controls; }

  onSubmit() {
    this.submitted = true;

    if (this.registerForm.invalid) {
      return;
    }

    console.log(this.registerForm.value.NAME_COMMENT);
    console.log(this.registerForm.value.CONTENT);

    let nuevoComentario = { CONCERT_ID: this.concert_id, NAME_COMMENT: this.registerForm.value.NAME_COMMENT, CONTENT: this.registerForm.value.CONTENT };

    this.commentService.insertComments(nuevoComentario).subscribe((result) => {
      this.comments = result && (result['data']) && (result['data'].length > 0) ? result['data'][0] : [];

      window.location.reload();
    });



  }

}
