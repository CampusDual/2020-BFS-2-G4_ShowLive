import { Component, OnInit, Input } from '@angular/core';
import { Concert } from 'app/concert';

@Component({
  selector: 'app-concert-mini-card',
  templateUrl: './concert-mini-card.component.html',
  styleUrls: ['./concert-mini-card.component.scss']
})
export class ConcertMiniCardComponent implements OnInit {

  @Input() concert: Concert;


  constructor() { }

  ngOnInit() {
  }
}