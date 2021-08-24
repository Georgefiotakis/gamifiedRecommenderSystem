package gr.gfiotakis.imlCloud.model.persistence;

import javax.persistence.*;
import java.util.Collection;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {
    Integer userId;
    String username;
    String country;
    Integer coins;
    Integer level;
    String gender;
    Integer firstQuizCompleted;
    Integer age;
    String studentName;
    String email;
    String studentGoal;
//    Set<Achievement> achievement;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id", nullable = false)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "country")
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Basic
    @Column(name = "coins")
    public Integer getCoins() {
        return coins;
    }

    public void setCoins(Integer coins) {
        this.coins = coins;
    }

    @Basic
    @Column(name = "level")
    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    @Basic
    @Column(name = "gender")
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "first_quiz_completed")
    public Integer getFirstQuizCompleted() {
        return firstQuizCompleted;
    }

    public void setFirstQuizCompleted(Integer firstQuizCompleted) {
        this.firstQuizCompleted = firstQuizCompleted;
    }

    @Basic
    @Column(name = "age")
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Basic
    @Column(name = "name")
    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "studentGoal")
    public String getStudentGoal() {
        return studentGoal;
    }

    public void setStudentGoal(String studentGoal) {
        this.studentGoal = studentGoal;
    }

//    @ManyToMany(mappedBy = "user")
//    public Set<Achievement> getAchievement() {
//        return achievement;
//    }
//
//    public void setAchievement(Set<Achievement> achievement) {
//        this.achievement = achievement;
//    }
}
