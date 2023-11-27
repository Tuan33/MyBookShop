/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author tranh
 */
public class Author {
    private int authorId;
    private String name;
    private String description;
    private String image;

    public Author() {
    }

    public Author(int authorId, String name, String description, String image) {
        this.authorId = authorId;
        this.name = name;
        this.description = description;
        this.image = image;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Author{" + "authorId=" + authorId + ", name=" + name + ", description=" + description + ", image=" + image + '}';
    }
    
}
