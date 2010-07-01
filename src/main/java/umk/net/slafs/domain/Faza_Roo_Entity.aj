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
import umk.net.slafs.domain.Faza;

privileged aspect Faza_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Faza.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Faza.id;
    
    @Version
    @Column(name = "version")
    private Integer Faza.version;
    
    public Long Faza.getId() {
        return this.id;
    }
    
    public void Faza.setId(Long id) {
        this.id = id;
    }
    
    public Integer Faza.getVersion() {
        return this.version;
    }
    
    public void Faza.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Faza.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Faza.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Faza attached = this.entityManager.find(Faza.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Faza.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Faza.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Faza merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Faza.entityManager() {
        EntityManager em = new Faza().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Faza.countFazas() {
        return (Long) entityManager().createQuery("select count(o) from Faza o").getSingleResult();
    }
    
    public static List<Faza> Faza.findAllFazas() {
        return entityManager().createQuery("select o from Faza o").getResultList();
    }
    
    public static Faza Faza.findFaza(Long id) {
        if (id == null) return null;
        return entityManager().find(Faza.class, id);
    }
    
    public static List<Faza> Faza.findFazaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Faza o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
