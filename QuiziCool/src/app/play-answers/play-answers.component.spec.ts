import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PlayAnswersComponent } from './play-answers.component';

describe('PlayAnswersComponent', () => {
  let component: PlayAnswersComponent;
  let fixture: ComponentFixture<PlayAnswersComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PlayAnswersComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PlayAnswersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
