import { Component, OnInit, Input } from '@angular/core';
import { Concert } from 'app/concert';
import { ActivatedRoute } from '@angular/router';
import { ConcertService } from 'app/concert.service';


@Component({
  selector: 'app-search-results',
  templateUrl: './search-results.component.html',
  styleUrls: ['./search-results.component.scss']
})
export class SearchResultsComponent implements OnInit{
  
  concerts:Concert[];

  constructor(private route:ActivatedRoute, private concertService:ConcertService) { }

  ngOnInit(){
    this.route.params.subscribe(data => {
      this.concertService.getConcerts(data).subscribe(result =>{    
        this.concerts = result && (result['data'].length != undefined) ? result['data'] : [];
        console.log(this.concerts);
      });
    });
  }
}

