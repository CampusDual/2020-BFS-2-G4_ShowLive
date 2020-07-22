import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Concert } from './concert';
import { Config } from 'ontimize-web-ngx';

@Injectable({providedIn:'root'})
export class ConcertService{

    private concertsURL:string;

    constructor(private http:HttpClient){
        this.concertsURL =  'http://localhost:33333/concerts/concertSearch';
    }
    getConcerts(parameters){
        const httpOptions = {headers:new HttpHeaders({'Access-Control-Allow-Origin': '*','Content-Type': 'application/json;charset=UTF-8'})};
        const body = {
            "filter": {
                "CONCERT_NAME": parameters.name,
            },
            "columns": [
                "LOCATION_NAME", "DATE", "DESCRIPTION", "CONCERT_NAME","CONCERT_ID","GENRE_NAME"
            ]
        };
        if(parameters.city != '-') body.filter["PROVINCE"] = parameters.city;
        if(parameters.genre != '-') body.filter["GENRE_NAME"] = parameters.genre;
        return this.http.post<Concert[]>(this.concertsURL,JSON.stringify(body),httpOptions);
    }
    getLastConcerts(){
        const httpOptions = {headers:new HttpHeaders({'Access-Control-Allow-Origin': '*','Content-Type': 'application/json;charset=UTF-8'})};
        const body = {
            "filter": {},
            "columns": [
                "DATE", "DESCRIPTION", "CONCERT_NAME","CONCERT_ID","GENRE_NAME"
            ]
        };
        return this.http.post<Concert[]>('http://localhost:33333/concerts/lastConcert',JSON.stringify(body),httpOptions);
    }

    getMostViewConcerts(){
        const httpOptions = {headers:new HttpHeaders({'Access-Control-Allow-Origin': '*','Content-Type': 'application/json;charset=UTF-8'})};
        const body = {
            "filter": {},
            "columns": [
                "DATE", "DESCRIPTION", "CONCERT_NAME","CONCERT_ID","GENRE_NAME"
            ]
        };
        return this.http.post<Concert[]>('http://localhost:33333/concerts/mostViewConcert',JSON.stringify(body),httpOptions);
    }
}
