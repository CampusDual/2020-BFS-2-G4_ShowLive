import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import {Concert, CONCERTS} from 'app/concert';

import { NguCarouselConfig, NguCarousel } from '@ngu/carousel';
import {ActivatedRoute} from "@angular/router";
import {ConcertService} from "../concert.service";

@Component({
  selector: 'app-index-page',
  templateUrl: './index-page.component.html',
  styleUrls: ['./index-page.component.scss']
})
export class IndexPageComponent implements OnInit {

  lastConcerts: Concert[];
  mostViewConcerts: Concert[];

  name = 'Angular';
  slideNo = 0;
  withAnim = true;
  resetAnim = true;
 
  @ViewChild('masBuscados') masBuscados: NguCarousel;
  @ViewChild('recentAdds') recentAdds: NguCarousel;
  carouselConfig: NguCarouselConfig = {
    grid: { xs: 4, sm: 4, md: 4, lg: 4, all: 0 },
    load: 4,
    loop: false,
    touch: true,
    velocity: 0.2
  }
  carouselItems = CONCERTS;
 
  constructor(private cdr: ChangeDetectorRef, private concertService:ConcertService) {}
  ngOnInit(){
    this.concertService.getLastConcerts().subscribe(result =>{
        this.lastConcerts = result && result['data'] ? result['data'] : [];
        console.log(this.lastConcerts)
    });

    this.concertService.getMostViewConcerts().subscribe(result =>{
      this.mostViewConcerts = result && result['data'] ? result['data'] : [];
      console.log(this.mostViewConcerts)
    });
  }
 
  ngAfterViewInit() {
    this.cdr.detectChanges();
  }

}
