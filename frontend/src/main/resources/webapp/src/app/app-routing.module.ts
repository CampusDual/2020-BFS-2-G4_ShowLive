import { NgModule, NgModuleFactory } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SearchResultsComponent } from './search-results/search-results.component';
import { IndexPageComponent } from './index-page/index-page.component';
import { ConcertDetailComponent } from './concert-detail/concert-detail.component';
import { ArtistDetailComponent } from './artist-detail/artist-detail.component';


export const routes: Routes = [
  { path: '', redirectTo: '/index', pathMatch: 'full'},
  { path: 'index', component: IndexPageComponent },
  { path: 'search-results/:startDate/:endDate/:city/:genre/:name', component:SearchResultsComponent },
  { path: 'concertDetail/:concert_id', component:ConcertDetailComponent },
  { path: 'artistDetail/:artist_id', component:ArtistDetailComponent }
];

const opt = {
  enableTracing: false
  // true if you want to print navigation routes
};

@NgModule({
  imports: [RouterModule.forRoot(routes, opt)],
  exports: [RouterModule],
  providers: []
})
export class AppRoutingModule { }
