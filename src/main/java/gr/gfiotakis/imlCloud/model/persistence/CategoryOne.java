package gr.gfiotakis.imlCloud.model.persistence;

import javax.persistence.*;

@Entity
@Table(name = "category_one")
public class CategoryOne {
    Integer categoryOneId;
    Integer lessonOne;
    Integer lessonTwo;
    Integer lessonThree;
    User user;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "category_one_id", nullable = false)
    public Integer getCategoryOneId() {
        return categoryOneId;
    }

    public void setCategoryOneId(Integer categoryOneId) {
        this.categoryOneId = categoryOneId;
    }

    @Basic
    @Column(name = "lesson_one")
    public Integer getLessonOne() {
        return lessonOne;
    }

    public void setLessonOne(Integer lessonOne) {
        this.lessonOne = lessonOne;
    }

    @Basic
    @Column(name = "lesson_two")
    public Integer getLessonTwo() {
        return lessonTwo;
    }

    public void setLessonTwo(Integer lessonTwo) {
        this.lessonTwo = lessonTwo;
    }

    @Basic
    @Column(name = "lesson_three")
    public Integer getLessonThree() {
        return lessonThree;
    }

    public void setLessonThree(Integer lessonThree) {
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
