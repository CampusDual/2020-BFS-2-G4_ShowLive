import { Component, OnInit, Input } from '@angular/core';
import { CONCERTS, Concert } from 'app/concert';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-search-results',
  templateUrl: './search-results.component.html',
  styleUrls: ['./search-results.component.scss']
})
export class SearchResultsComponent {
  
  concerts:Concert[];

  constructor(private route:ActivatedRoute) { 
    this.route.params.subscribe(params => console.log(params));
   }

}

