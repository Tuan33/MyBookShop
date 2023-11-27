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
public class Book {
    private int bookID;
    private String title;
    private int authorID;
    private String description;
    private double price;
    private Date publicationDate;
    private String publisher;
    private int quantityInStock;
    private String categoryID;
    private String image;
    public Book() {
    }

    public Book(int bookID, String title, int authorID, String description, double price, Date publicationDate, String publisher, int quantityInStock, String categoryID, String image) {
        this.bookID = bookID;
        this.title = title;
        this.authorID = authorID;
        this.description = description;
        this.price = price;
        this.publicationDate = publicationDate;
        this.publisher = publisher;
        this.quantityInStock = quantityInStock;
        this.categoryID = categoryID;
        this.image = image;
    }

    

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getAuthor() {
        return authorID;
    }

    public void setAuthor(int authorID) {
        this.authorID = authorID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Book{" + "bookID=" + bookID + ", title=" + title + ", authorID=" + authorID + ", description=" + description + ", price=" + price + ", publicationDate=" + publicationDate + ", publisher=" + publisher + ", quantityInStock=" + quantityInStock + ", categoryID=" + categoryID + ", image=" + image + '}';
    }
    
    
    
    
}
