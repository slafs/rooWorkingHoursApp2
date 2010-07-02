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
import umk.net.slafs.domain.Developer;

privileged aspect Developer_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Developer.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Developer.id;
    
    @Version
    @Column(name = "version")
    private Integer Developer.version;
    
    public Long Developer.getId() {
        return this.id;
    }
    
    public void Developer.setId(Long id) {
        this.id = id;
    }
    
    public Integer Developer.getVersion() {
        return this.version;
    }
    
    public void Developer.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Developer.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Developer.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Developer attached = this.entityManager.find(Developer.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Developer.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Developer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Developer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Developer.entityManager() {
        EntityManager em = new Developer().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Developer.countDevelopers() {
        return (Long) entityManager().createQuery("select count(o) from Developer o").getSingleResult();
    }
    
    public static List<Developer> Developer.findAllDevelopers() {
        return entityManager().createQuery("select o from Developer o").getResultList();
    }
    
    public static Developer Developer.findDeveloper(Long id) {
        if (id == null) return null;
        return entityManager().find(Developer.class, id);
    }
    
    public static List<Developer> Developer.findDeveloperEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Developer o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
