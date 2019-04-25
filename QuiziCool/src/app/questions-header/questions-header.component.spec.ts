import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { QuestionsHeaderComponent } from './questions-header.component';

describe('QuestionsHeaderComponent', () => {
  let component: QuestionsHeaderComponent;
  let fixture: ComponentFixture<QuestionsHeaderComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ QuestionsHeaderComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(QuestionsHeaderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
