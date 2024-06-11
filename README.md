# machine-learning-project
Using machine learning for the final project of the Columbia data analysis and visualization bootcamp

Can we use machine learning to predict which National Basketball Association (NBA) team will win a game?

There are 30 teams in the NBA, and each team plays 82 games in the regular season, with at least 1,230 matchups each regular season. 
There is the potential of an additional 105 games in the postseason.

What makes a winning team? We wanted to see if a machine-learning model could predict game outcomes based on team statistics, such as:
* Points scored at home
* Points scored away
* Free throw percentages
* Field goal (2-pointers and 3-pointers) percentages
* Number of Blocks
* Number of Steals

Terminology
* ast_away: The total assists by the visiting team
* ast_home: The total assists by the home team
* blk: Blocks made by the player
* fg_pct_away: The field goal percentage of the visiting team
* fg_pct_home: The field goal percentage of the home team
* fg3_pct_away: The three-point field goal percentage of the visiting team
* fg3_pct_home: The three-point field goal percentage of the home team
* ft_pct_away: The free throw percentage of the visiting team
* ft_pct_home: The free throw percentage of the home team
* pf: Personal fouls committed by the player
* stl: Steals. The number of times a defensive player legally takes the ball away from an offensive player.
* to: Turnover. Any loss of possession of the ball by a team. 

Data Processing Workflow
1. Data Acquisition:
  Obtained data from Kaggle.
    * https://www.kaggle.com/datasets/nathanlauga/nba-games?select=games.csv
    * https://www.kaggle.com/datasets/logandonaldson/sports-stadium-locations
    * Consisted of 5 CSV files: rankings, teams, games, games_details, and players.
2. Initial Challenges:
  Difficulty importing data into SQL directly.
  Leveraged Excel for initial data cleaning to resolve import issues.
3. Data Integration:
  Merged selected files using SQL to create a unified dataset.
4. Data Refinement with Jupyter:
  Utilized Jupyter for further data cleaning.
  Dropped columns with missing or irrelevant data to streamline analysis.
5. Outcome:
  Achieved a refined dataset ready for analysis and insights extraction.

Model Preparation and Results
Random Forest 
* Random Forest is a machine learning model based on decision trees.
* Utilizes multiple decision trees to improve predictive performance and reduce overfitting.
* We decided to use Random Forest because:
  It is good at handling large datasets with multiple dimensions.
  It can be used to generate feature importance which is useful for further analysis.

Random Forest Parameters
* n_estimators: 100
* random_state: 42

Classification Report:
![model_classification_report](https://github.com/dancab13/machine-learning-project/assets/147662348/f10cbba4-838d-462c-8fad-b406f7537c38)

Results Interpretation
* The model accuracy of 94.35% shows a highly reliable model which is robust to overfitting.
* The precision and recall values are high for both home team wins and losses. The model succeeds at making predictions and could identity the majority of instances in both classes.
* The F1-score, macro average, and weighted average are all high, indicating that the model performs well overall. The high weighted average, in particular, shows that the model maintains its accuracy even when considering the support (the number of actual occurrences) of each class.

Random Forest Findings
![Feature_Importance](https://github.com/dancab13/machine-learning-project/assets/147662348/5fd733e5-8a7e-4242-9853-5613c5446cf5)

* Using Random Forest, we found that the most important stats in predicting a winner was the points per possession metric for each team. This was a calculated feature which measures how efficient a team is an a possession by possession basis.
* Rebound efficiency, which measures the proportion of available rebounds secured by a team, emerged as a significant indicator of game outcomes. This metric highlights the importance of controlling the boards, as teams with higher rebound efficiency are more likely to win games. Emphasizing improvements in this area could provide teams with a strategic advantage, suggesting that focusing on rebounding can be crucial for success
* Blocks were the least important feature, suggesting it is more important for teams to make their own baskets than prevent the other team from doing so.

Home vs. Away Games
![Home Team Wins](https://github.com/dancab13/machine-learning-project/assets/147662348/d01db500-dbf9-4b27-823a-51eaa557a6aa)
* Null Hypothesis: There is no difference in performance between playing at home and playing away.
* Alternative Hypothesis: There is a difference in performance between playing at home and playing away.
* Paired t-test results:
  t-statistic: 33.98416142035553
  p-value: 7.907332620332287e-248
* Reject the null hypothesis: There is a significant difference in performance between home and away games.

Three-point Field Goal Percentage (FG3%) of Teams
* The difference in three-point field goal percentage between home and away is generally insignificant, teams maintain similar three-point field goal percentage regardless of game location.
* Contrary to common belief, the difference in FG3% suggests that there is no substantial advantage or disadvantage associated with playing at home or away.
* The data underscores that while there are slight differences, they are not substantial enough to indicate a significant home court advantage in three-point shooting efficiency. This insight challenges conventional wisdom and highlights the importance of factors beyond game location in perimeter shooting performance.

Future Models
* Generally, our features focused on team-wide stats, but focusing on player performance and team roster could help strengthen future models.
* Future models could use more or other stats, such as court position of field goals, to see if the model’s accuracy could improve. Likewise, other stats may be more important features than ones we used.
* Using a neural network could potentially increase the accuracy as well.
* Our model used mostly quantitative data with some qualitative data. However, all our data were hard, objective facts. It would be interesting to incorporate subjective analysis such as “team morale” or “crowd energy.” 
