package umk.net.slafs.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;
import umk.net.slafs.domain.Projekt;

privileged aspect Projekt_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Projekt.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Projekt.id;
    
    @Version
    @Column(name = "version")
    private Integer Projekt.version;
    
    public Long Projekt.getId() {
        return this.id;
    }
    
    public void Projekt.setId(Long id) {
        this.id = id;
    }
    
    public Integer Projekt.getVersion() {
        return this.version;
    }
    
    public void Projekt.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Projekt.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Projekt.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Projekt attached = this.entityManager.find(Projekt.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Projekt.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Projekt.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Projekt merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Projekt.entityManager() {
        EntityManager em = new Projekt().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Projekt.countProjekts() {
        return (Long) entityManager().createQuery("select count(o) from Projekt o").getSingleResult();
    }
    
    public static List<Projekt> Projekt.findAllProjekts() {
        return entityManager().createQuery("select o from Projekt o").getResultList();
    }
    
    public static Projekt Projekt.findProjekt(Long id) {
        if (id == null) return null;
        return entityManager().find(Projekt.class, id);
    }
    
    public static List<Projekt> Projekt.findProjektEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Projekt o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
