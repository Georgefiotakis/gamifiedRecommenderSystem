package gr.gfiotakis.imlCloud.model.persistence;

import javax.persistence.*;

@Entity
@Table(name = "purple_planet")
public class PurplePlanet {

    Integer purplePlanetId;
    String questionOne;
    String questionTwo;
    String questionThree;
    String questionFour;
    String questionFive;
    User user;
    Survey survey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "purple_planet_id", nullable = false)
    public Integer getPurplePlanetId() {
        return purplePlanetId;
    }

    public void setPurplePlanetId(Integer purplePlanetId) {
        this.purplePlanetId = purplePlanetId;
    }

    @Basic
    @Column(name = "question_one")
    public String getQuestionOne() {
        return questionOne;
    }

    public void setQuestionOne(String questionOne) {
        this.questionOne = questionOne;
    }

    @Basic
    @Column(name = "question_two")
    public String getQuestionTwo() {
        return questionTwo;
    }

    public void setQuestionTwo(String questionTwo) {
        this.questionTwo = questionTwo;
    }

    @Basic
    @Column(name = "question_three")
    public String getQuestionThree() {
        return questionThree;
    }

    public void setQuestionThree(String questionThree) {
        this.questionThree = questionThree;
    }

    @Basic
    @Column(name = "question_four")
    public String getQuestionFour() {
        return questionFour;
    }

    public void setQuestionFour(String questionFour) {
        this.questionFour = questionFour;
    }

    @Basic
    @Column(name = "question_five")
    public String getQuestionFive() {
        return questionFive;
    }

    public void setQuestionFive(String questionFive) {
        this.questionFive = questionFive;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne
    @JoinColumn(name = "survey_id", referencedColumnName = "survey_id", nullable = false)
    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }
}
