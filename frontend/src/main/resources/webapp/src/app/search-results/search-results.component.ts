import { Component, OnInit } from '@angular/core';
import { CONCERTS } from 'app/concert';

@Component({
  selector: 'app-search-results',
  templateUrl: './search-results.component.html',
  styleUrls: ['./search-results.component.scss']
})
export class SearchResultsComponent implements OnInit {

  concerts = CONCERTS;

  constructor() { }

  ngOnInit() {

  }

}

