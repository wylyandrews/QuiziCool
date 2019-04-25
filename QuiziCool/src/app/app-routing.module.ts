import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { QuestionsComponent } from './questions/questions.component';
import { PlayComponent } from './play/play.component';

import { QuestionsHeaderComponent } from './questions-header/questions-header.component';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'questions', component: QuestionsComponent },
  { path: 'play', component: PlayComponent }
]

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
