import { Component, OnInit, ViewChild, Inject } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { Concert } from './concert';
import { SearchResultsComponent } from './search-results/search-results.component';

@Component({
  selector: 'o-app',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  
  constructor() {
  }

  ngOnInit() {
  }
}
