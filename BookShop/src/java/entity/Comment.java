/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author tranh
 */
public class Comment {
    int commentID;
    int customerID;
    int bookID;
    String comment;
    int rating;
    Date commentDate;

    public Comment() {
    }

    public Comment(int commentID, int customerID, int bookID, String comment, int rating, Date commentDate) {
        this.commentID = commentID;
        this.customerID = customerID;
        this.bookID = bookID;
        this.comment = comment;
        this.rating = rating;
        this.commentDate = commentDate;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    @Override
    public String toString() {
        return "Comments{" + "commentID=" + commentID + ", customerID=" + customerID + ", bookID=" + bookID + ", comment=" + comment + ", rating=" + rating + ", commentDate=" + commentDate + '}';
    }
    
    
}
