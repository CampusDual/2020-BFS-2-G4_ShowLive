import { Component, OnInit, Input } from '@angular/core';
import { Concert } from '../concert';

@Component({
  selector: 'app-concert-detail',
  templateUrl: './concert-detail.component.html',
  styleUrls: ['./concert-detail.component.scss']
})
export class ConcertDetailComponent implements OnInit {

  @Input() concert: Concert;

  constructor() { }

  ngOnInit() {
  }

}
