import { Component, OnInit, Input } from '@angular/core';
import { PlayAnswersComponent } from '../play-answers/play-answers.component';
import { Score } from '../score'
import { DbService } from '../db.service';

@Component({
  selector: 'app-play-score',
  templateUrl: './play-score.component.html',
  styleUrls: ['./play-score.component.css']
})
export class PlayScoreComponent implements OnInit {

  displayScore: number;
  highScores: Score[];

  constructor(private db: DbService) { }

  ngOnInit() {
  }

  fillHighScores(categoryid: number) {
    this.db.getScores(categoryid).subscribe(scores => this.highScores = scores);
  }

}
