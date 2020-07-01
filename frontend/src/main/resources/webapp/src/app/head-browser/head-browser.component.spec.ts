import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HeadBrowserComponent } from './head-browser.component';

describe('HeadBrowserComponent', () => {
  let component: HeadBrowserComponent;
  let fixture: ComponentFixture<HeadBrowserComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HeadBrowserComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HeadBrowserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
