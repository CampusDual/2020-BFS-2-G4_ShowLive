import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { CONCERTS } from 'app/concert';

import { NguCarouselConfig, NguCarousel } from '@ngu/carousel';

@Component({
  selector: 'app-index-page',
  templateUrl: './index-page.component.html',
  styleUrls: ['./index-page.component.scss']
})
export class IndexPageComponent implements OnInit {

  concerts = CONCERTS;

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
 
  constructor(private cdr: ChangeDetectorRef) {}
  ngOnInit(){  }
 
  ngAfterViewInit() {
    this.cdr.detectChanges();
  }

}