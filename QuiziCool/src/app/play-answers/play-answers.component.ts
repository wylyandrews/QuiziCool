import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { Question } from '../question';
import { PlayQuestionsColumnComponent } from '../play-questions-column/play-questions-column.component';
import { PlayScoreComponent } from '../play-score/play-score.component';
import { DbService } from '../db.service';

@Component({
  selector: 'app-play-answers',
  templateUrl: './play-answers.component.html',
  styleUrls: ['./play-answers.component.scss']
})
export class PlayAnswersComponent implements OnInit {

  @Input() playQuestions: PlayQuestionsColumnComponent;
  @Input() playScore: PlayScoreComponent;

  categoryid: number;
  username: string;
  
  questions: Question[] = new Array();

  score: number = 0;
  currentQ: number = 0;

  countCorrect: number = 0;
  countWrong: number = 0;

  constructor(private db: DbService, public router: Router) { }

  ngOnInit() {

    this.categoryid = window.history.state.categoryid;
    this.username = window.history.state.username;

    this.playScore.fillHighScores(this.categoryid)

    this.db.getQuestions(this.categoryid).subscribe(questions => {this.questions = questions; this.updateDisplay()});
  }

  clickAnswer(choice: string) {
    if(choice == this.questions[this.currentQ].answer) {
      //correct answer
      this.countCorrect++;
      this.score += Number(this.questions[this.currentQ].score);
      console.log('added score: ' + Number(this.questions[this.currentQ].score));
      console.log('currentQ: ' + this.currentQ);
    }
    else {
      //wrong answer
      this.countWrong++;
    }

    if(this.currentQ + 1 == this.questions.length) {
      //end of quiz
      //this.db.addScore(this.username, this.categoryid, this.score);
      //modal stuff
      //this.router.navigateByUrl('/');
      //document.getElementById('displayScoreModal').setAttribute('display:', 'block');
      document.getElementById("displayScoreModal").style.display = "block";
      document.getElementById("displayScoreModal").style.opacity = "1";
      document.getElementById("scoreHack").innerHTML = String(this.score);
      document.getElementById("scoreHack2").innerHTML = String(this.score);
      this.db.addScore(this.username, this.categoryid, this.score, this.countCorrect).subscribe();
    }

    this.currentQ++;
    this.updateDisplay();
  }

  updateDisplay() {

    this.playQuestions.question = this.currentQ + 1;
    this.playQuestions.remaining = this.questions.length - this.currentQ;
    this.playQuestions.ratio = (this.countCorrect + this.countWrong) + "/" + this.questions.length;

    this.playScore.displayScore = this.score;
  }

}
