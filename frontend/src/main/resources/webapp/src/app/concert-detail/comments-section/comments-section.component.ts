import { Component, OnInit } from '@angular/core';
import { Comment } from 'app/concertComment';
import { ActivatedRoute, Router } from '@angular/router';
import { CommentService } from 'app/comment.service';

@Component({
  selector: 'app-comments-section',
  templateUrl: './comments-section.component.html',
  styleUrls: ['./comments-section.component.scss']
})
export class CommentsSectionComponent implements OnInit {

  comments: Comment[];

  constructor(private route: ActivatedRoute, private commentService: CommentService) { }

  getValue() {

  }

  commentSubmit() {
    this.route.params.subscribe();
  }

  ngOnInit() {
    this.route.params.subscribe(data => {
      this.commentService.getComments(data).subscribe((result) => {
        this.comments = result && (result['data']) && (result['data'].length > 0) ? result['data'] : [];
      });
    });
  }
}
