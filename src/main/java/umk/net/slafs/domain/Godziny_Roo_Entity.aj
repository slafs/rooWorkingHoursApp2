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
import umk.net.slafs.domain.Godziny;

privileged aspect Godziny_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Godziny.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Godziny.id;
    
    @Version
    @Column(name = "version")
    private Integer Godziny.version;
    
    public Long Godziny.getId() {
        return this.id;
    }
    
    public void Godziny.setId(Long id) {
        this.id = id;
    }
    
    public Integer Godziny.getVersion() {
        return this.version;
    }
    
    public void Godziny.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Godziny.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Godziny.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Godziny attached = this.entityManager.find(Godziny.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Godziny.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Godziny.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Godziny merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Godziny.entityManager() {
        EntityManager em = new Godziny().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Godziny.countGodzinys() {
        return (Long) entityManager().createQuery("select count(o) from Godziny o").getSingleResult();
    }
    
    public static List<Godziny> Godziny.findAllGodzinys() {
        return entityManager().createQuery("select o from Godziny o").getResultList();
    }
    
    public static Godziny Godziny.findGodziny(Long id) {
        if (id == null) return null;
        return entityManager().find(Godziny.class, id);
    }
    
    public static List<Godziny> Godziny.findGodzinyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Godziny o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
