import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConcertMiniCardComponent } from './concert-mini-card.component';

describe('ConcertMiniCardComponent', () => {
  let component: ConcertMiniCardComponent;
  let fixture: ComponentFixture<ConcertMiniCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConcertMiniCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConcertMiniCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});