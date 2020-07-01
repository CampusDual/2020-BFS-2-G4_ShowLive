import { Component, OnInit } from '@angular/core';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { OntimizeWebModule } from 'ontimize-web-ngx';

@Component({
  selector: 'app-head-browser',
  templateUrl: './head-browser.component.html',
  styleUrls: ['./head-browser.component.scss']
})
export class HeadBrowserComponent implements OnInit {
    
  public selected = {}; 
  public arrayCiudades: Object[] = [{ key: 1, value: 'Álava' }, { key: 2, value: 'Albacete' }, { key: 3, value: 'Alicante' }, { key: 4, value: 'Almería' }, { key: 5, value: 'Asturias' }, { key: 6, value: 'Ávila' }, { key: 7, value: 'Badajoz' }, { key: 8, value: 'Barcelona' }, { key: 9, value: 'Burgos' }, { key: 10, value: 'Cáceres' }, { key: 11, value: 'Cádiz' }, { key: 12, value: 'Cantrabria' }, { key: 13, value: 'Castellón' }, { key: 14, value: 'Ciudad Real' }, { key: 15, value: 'Córdoba' }, { key: 16, value: 'Cuenca' }, { key: 17, value: 'Girona' }, { key: 18, value: 'Granada' }, { key: 19, value: 'Guadalajara' }, { key: 20, value: 'Guipúzcoa' }, { key: 21, value: 'Huelva' }, { key: 22, value: 'Huesca' }, { key: 23, value: 'Islas Baleares' }, { key: 24, value: 'Jaén' }, { key: 25, value: 'A Coruña' }, { key: 26, value: 'La Rioja' }, { key: 27, value: 'Las Palmas' }, { key: 28, value: 'León' }, { key: 29, value: 'Lleida' }, { key: 30, value: 'Lugo' }, { key: 31, value: 'Madrid' }, { key: 32, value: 'Málaga' }, { key: 33, value: 'Murcia' }, { key: 34, value: 'Navarra' }, { key: 35, value: 'Ourense' }, { key: 36, value: 'Palencia' }, { key: 37, value: 'Pontevedra' }, { key: 39, value: 'Salamanca' }, { key: 40, value: 'Santa Cruz de Tenerife' }, { key: 41, value: 'Segovia' }, { key: 42, value: 'Sevilla' }, { key: 43, value: 'Soria' }, { key: 44, value: 'Tarragona' }, { key: 45, value: 'Teruel' }, { key: 46, value: 'Toledo' }, { key: 47, value: 'Valencia' }, { key: 48, value: 'Valladolid' }, { key: 49, value: 'Vizcaya' }, { key: 50, value: 'Zamora' }];
  public arrayGeneros: Object[] = [{ key: 1, value: 'Pop' }, { key: 2, value: 'Rock' }, { key: 3, value: 'Electronica' }, { key: 4, value: 'Jazz' }, { key: 5, value: 'Dubstep' }, { key: 6, value: 'R&B' }, { key: 7, value: 'Rap' }, { key: 8, value: 'HipHop' }, { key: 9, value: 'Heavy Metal' }, { key: 10, value: 'Trap' }];
  constructor() { 
  }
    
  getValue() { 
    return this.selected; 
  }
    
  public getDataArrayCiudades(): any[] { return this.arrayCiudades; } 
  public getDataArrayGeneros(): any[] { return this.arrayGeneros; } 
  public getValueSimple(): any { return 2; }

  ngOnInit() {
  }


}

