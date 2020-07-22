import { Component, OnInit } from '@angular/core';
import { Concert } from 'app/concert';
import { ActivatedRoute } from '@angular/router';
import { ConcertService } from 'app/concert.service';

@Component({
  selector: 'app-concert-detail',
  templateUrl: './concert-detail.component.html',
  styleUrls: ['./concert-detail.component.scss']
})
export class ConcertDetailComponent implements OnInit {

  concerts:Concert;

  constructor(private route: ActivatedRoute, private concertService: ConcertService) { }

  ngOnInit(){
    this.route.params.subscribe(data => {
      this.concertService.getConcertsDetail(data).subscribe(result =>{    
        this.concerts = result && (result['data']) && (result['data'].length>0) ? result['data'][0] : {};
        console.log(this.concerts);
      });
    });
  }
}
