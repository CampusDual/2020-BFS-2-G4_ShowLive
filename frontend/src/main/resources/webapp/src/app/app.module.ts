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
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';


// Standard providers...
// Defining custom providers (if needed)...
export const customProviders: any = [
];

@NgModule({
  imports: [
    ONTIMIZE_MODULES,
    OntimizeWebModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  declarations: [
    AppComponent,
    HeadBrowserComponent,
    SearchResultsComponent,
    ConcertCardComponent
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
