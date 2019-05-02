import { Component, OnInit, Input } from '@angular/core';
import { PlayAnswersComponent } from '../play-answers/play-answers.component';

@Component({
  selector: 'app-play-questions-column',
  templateUrl: './play-questions-column.component.html',
  styleUrls: ['./play-questions-column.component.css']
})
export class PlayQuestionsColumnComponent implements OnInit {

  question: number;
  remaining: number;
  ratio: string;

  constructor() { }

  ngOnInit() {
  }

}
