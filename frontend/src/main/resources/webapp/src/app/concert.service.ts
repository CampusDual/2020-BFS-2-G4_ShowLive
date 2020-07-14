import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Observable } from "rxjs";
import { Concert } from "./concert";

@Injectable({providedIn:'root'})
export class ConcertService{

    private concertsURL:string;
    httpOptions = {headers:new HttpHeaders({"Authorization":"Basic "+ btoa("demo:demouser"),"Access-Control-Allow-Origin": "*","Access-Control-Allow-Methods":"POST"})}

    constructor(private http:HttpClient){
        this.concertsURL =  "http://localhost:33333/concerts/currentConcerts";
    }

    getConcerts(): Observable<Concert[]>{
        return this.http.post<Concert[]>(this.concertsURL,{
            "filter": {
                "CONCERT_ID": 5
            },
            "columns": [
                "CONCERT_ID","DESCRIPTION"    
            ]
        },this.httpOptions)
    }
}