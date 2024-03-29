import { NgModule } from '@angular/core';

import {
  APP_CONFIG,
  ONTIMIZE_MODULES,
  ONTIMIZE_PROVIDERS,
  OntimizeWebModule
} from 'ontimize-web-ngx';

import { CONFIG } from './app.config';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { HeadBrowserComponent } from './head-browser/head-browser.component';
import { SearchResultsComponent } from './search-results/search-results.component';
import { ConcertCardComponent } from './concert-card/concert-card.component';
import { ConcertMiniCardComponent } from './concert-mini-card/concert-mini-card.component';
import { IndexPageComponent } from './index-page/index-page.component';
import { NguCarouselModule } from '@ngu/carousel';
import { ConcertDetailComponent } from './concert-detail/concert-detail.component';
import { CommentsSectionComponent } from './concert-detail/comments-section/comments-section.component';
import { HttpClientModule } from '@angular/common/http';
import { CommentItemComponent } from './concert-detail/comments-section/comment-item/comment-item.component';
import { ArtistDetailComponent } from './artist-detail/artist-detail.component';

// Standard providers...
// Defining custom providers (if needed)...
export const customProviders: any = [
];

@NgModule({
  imports: [
    ONTIMIZE_MODULES,
    OntimizeWebModule,
    AppRoutingModule,
    HttpClientModule,
    NguCarouselModule
  ],
  declarations: [
    AppComponent,
    HeadBrowserComponent,
    SearchResultsComponent,
    ConcertCardComponent,
    ConcertMiniCardComponent,
    IndexPageComponent,
    ConcertDetailComponent,
    CommentsSectionComponent,
    CommentItemComponent,
    ArtistDetailComponent
  ],
  bootstrap: [
    AppComponent
  ],
  providers: [
    { provide: APP_CONFIG, useValue: CONFIG },
    ...ONTIMIZE_PROVIDERS,
    ...customProviders
  ],
})
export class AppModule { }
