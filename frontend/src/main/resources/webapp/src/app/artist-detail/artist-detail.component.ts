import { Component, OnInit, ViewChild, ChangeDetectorRef } from '@angular/core';
import { Artist } from 'app/artist';
import { ActivatedRoute } from '@angular/router';
import { ArtistService } from 'app/artist.service';

import { NguCarousel, NguCarouselConfig } from '@ngu/carousel';
import { CONCERTS, Concert } from 'app/concert';
import { ConcertService } from 'app/concert.service';

@Component({
  selector: 'app-artist-detail',
  templateUrl: './artist-detail.component.html',
  styleUrls: ['./artist-detail.component.scss']
})
export class ArtistDetailComponent implements OnInit {

  artist:Artist;

  concertsOfArtist:Concert[];

  name = 'Angular';
  slideNo = 0;
  withAnim = true;
  resetAnim = true;

  @ViewChild('recentAdds') recentAdds: NguCarousel;
  carouselConfig: NguCarouselConfig = {
    grid: { xs: 4, sm: 4, md: 4, lg: 4, all: 0 },
    load: 4,
    loop: false,
    touch: true,
    velocity: 0.2
  }

  constructor(private route: ActivatedRoute, private artistService: ArtistService,private cdr: ChangeDetectorRef,private concertService:ConcertService) { }

  ngOnInit(){
    this.route.params.subscribe(data => {
      this.artistService.getArtistsDetail(data).subscribe(result =>{    
        this.artist = result && (result['data']) && (result['data'].length>0) ? result['data'][0] : {};
      });
      this.concertService.getConcertsOfArtist(data).subscribe(result =>{    
        this.concertsOfArtist = result && (result['data']) && (result['data'].length>0) ? result['data'] : [];
      });

    });

  }

  ngAfterViewInit() {
    this.cdr.detectChanges();
  }

  hideTwitter():boolean{
    if (this.artist['TWITTER_LINK']==null)
        return true;
  }
  hideInstagram():boolean{
    if (this.artist['INSTAGRAM_LINK']==null)
        return true;
  }
  hideTwitch():boolean{
    if (this.artist['TWITCH_LINK']==null)
        return true;
  }
  hideYoutube():boolean{
    if (this.artist['YOUTUBE_LINK']==null)
        return true;
  }
  hideSpotify():boolean{
    if (this.artist['SPOTIFY_LINK']==null)
        return true;
  }
}
