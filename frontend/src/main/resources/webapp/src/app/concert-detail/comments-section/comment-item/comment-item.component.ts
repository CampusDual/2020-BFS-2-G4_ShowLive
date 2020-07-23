import { Component, OnInit, Input } from '@angular/core';
import { UserComment } from 'app/concertComment';

@Component({
  selector: 'app-comment-item',
  templateUrl: './comment-item.component.html',
  styleUrls: ['./comment-item.component.scss']
})
export class CommentItemComponent implements OnInit {

  @Input() comment: UserComment;

  constructor() { }

  ngOnInit() {
  }

}
