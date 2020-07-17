import { NgModule, NgModuleFactory } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SearchResultsComponent } from './search-results/search-results.component';
import { IndexPageComponent } from './index-page/index-page.component';

export const routes: Routes = [
  { path: 'index', component: IndexPageComponent },
  { path: 'search-results/:startDate/:endDate/:city/:genre/:name', component:SearchResultsComponent },
  { path: '', redirectTo: '/index', pathMatch: 'full'}  
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
