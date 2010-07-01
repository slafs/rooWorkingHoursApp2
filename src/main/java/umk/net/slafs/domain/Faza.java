package umk.net.slafs.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Faza {

    @NotNull
    @Column(name = "nazwa")
    private String name;
}
