package com.mycompany.model;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int id;
    private String name;
    private Role role;
    private String login;
    private String password;

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Role getRole() {
        return role;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public User(String name, Role role, String login, String password) {
        this.name = name;
        this.role = role;
        this.login = login;
        this.password = password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
