package gr.gfiotakis.imlCloud.model.persistence;

import javax.persistence.*;

@Entity
@Table(name = "category_two")
public class CategoryTwo {
    Integer categoryTwoId;
    Boolean lessonOne;
    Boolean lessonTwo;
    Boolean lessonThree;
    User user;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "category_two_id", nullable = false)
    public Integer getCategoryOneId() {
        return categoryTwoId;
    }

    public void setCategoryOneId(Integer categoryOneId) {
        this.categoryTwoId = categoryOneId;
    }

    @Basic
    @Column(name = "lesson_one")
    public Boolean getLessonOne() {
        return lessonOne;
    }

    public void setLessonOne(Boolean lessonOne) {
        this.lessonOne = lessonOne;
    }

    @Basic
    @Column(name = "lesson_two")
    public Boolean getLessonTwo() {
        return lessonTwo;
    }

    public void setLessonTwo(Boolean lessonTwo) {
        this.lessonTwo = lessonTwo;
    }

    @Basic
    @Column(name = "lesson_three")
    public Boolean getLessonThree() {
        return lessonThree;
    }

    public void setLessonThree(Boolean lessonThree) {
        this.lessonThree = lessonThree;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
