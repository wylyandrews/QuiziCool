import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PlayQuestionsColumnComponent } from './play-questions-column.component';

describe('PlayQuestionsColumnComponent', () => {
  let component: PlayQuestionsColumnComponent;
  let fixture: ComponentFixture<PlayQuestionsColumnComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PlayQuestionsColumnComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PlayQuestionsColumnComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
