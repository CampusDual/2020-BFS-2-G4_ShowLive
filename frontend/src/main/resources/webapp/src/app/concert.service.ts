import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Concert } from './concert';


@Injectable({ providedIn: 'root' })
export class ConcertService {
    private concertsURL: string;

    constructor(private http: HttpClient) {
        this.concertsURL = 'http://localhost:33333/concerts/concertSearch';
    }

    getConcerts(parameters) {
        const httpOptions = { headers: new HttpHeaders({ 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json;charset=UTF-8' }) };
        console.log(parameters.name)
        const body = {
            "filter": {
                "CONCERT_NAME": parameters.name,
            },
            "columns": [
                "LOCATION_NAME", "DATE", "DESCRIPTION", "CONCERT_NAME", "CONCERT_ID", "GENRE_NAME"
            ]
        };
        if (parameters.startDate != 0) body.filter["STARTDATE"] = parameters.startDate;
        if (parameters.endDate != 0) body.filter["ENDDATE"] = parameters.endDate;
        if (parameters.city != '-') body.filter["PROVINCE"] = parameters.city;
        if (parameters.genre != '-') body.filter["GENRE_NAME"] = parameters.genre;
        if (parameters.concert_id) body.filter["CONCERT_ID"] = parameters.concert_id;
        return this.http.post<Concert[]>(this.concertsURL, JSON.stringify(body), httpOptions);
    }


    getConcertsDetail(parameters) {
        const httpOptions = { headers: new HttpHeaders({ 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json;charset=UTF-8' }) };
        const body = {
            "filter": {
                "CONCERT_ID": parameters.concert_id
            },
            "columns": [
                "LOCATION_NAME", "DATE", "DESCRIPTION", "CONCERT_NAME", "CONCERT_ID", "ARTIST_NAME", "TICKETEA_LINK","ARTIST_ID","IS_STREAMING","TWITCH_LINK","YOUTUBE_LINK"
            ]
        };
        return this.http.post<Concert[]>('http://localhost:33333/concerts/concert/search', JSON.stringify(body), httpOptions);
    }

    getConcertsOfArtist(parameters) {
        const httpOptions = { headers: new HttpHeaders({ 'Access-Control-Allow-Origin': '*', 'Content-Type': 'application/json;charset=UTF-8' }) };
        const body = {
            "filter": {
                "ARTIST_ID": parameters.artist_id
            },
            "columns": [
                "LOCATION_NAME", "DATE", "DESCRIPTION", "CONCERT_NAME", "CONCERT_ID", "ARTIST_NAME", "TICKETEA_LINK","ARTIST_ID"
            ]
        };
        return this.http.post<Concert[]>('http://localhost:33333/concerts/concert/search', JSON.stringify(body), httpOptions);
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
