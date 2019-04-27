import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PlayScoreComponent } from './play-score.component';

describe('PlayScoreComponent', () => {
  let component: PlayScoreComponent;
  let fixture: ComponentFixture<PlayScoreComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PlayScoreComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PlayScoreComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
