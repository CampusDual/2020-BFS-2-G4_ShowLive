import { Component, OnInit, Input } from '@angular/core';
import { Concert } from 'app/concert';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-concert-card',
  templateUrl: './concert-card.component.html',
  styleUrls: ['./concert-card.component.scss']
})
export class ConcertCardComponent implements OnInit {

  @Input() concert: Concert;

  constructor(private route: ActivatedRoute) { }

  ngOnInit() {
    console.log(this.concert)
  }

}
