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
import umk.net.slafs.domain.Pracownik;

privileged aspect Pracownik_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Pracownik.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Pracownik.id;
    
    @Version
    @Column(name = "version")
    private Integer Pracownik.version;
    
    public Long Pracownik.getId() {
        return this.id;
    }
    
    public void Pracownik.setId(Long id) {
        this.id = id;
    }
    
    public Integer Pracownik.getVersion() {
        return this.version;
    }
    
    public void Pracownik.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Pracownik.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Pracownik.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Pracownik attached = this.entityManager.find(Pracownik.class, this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Pracownik.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Pracownik.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Pracownik merged = this.entityManager.merge(this);
        this.entityManager.flush();
        this.id = merged.getId();
    }
    
    public static final EntityManager Pracownik.entityManager() {
        EntityManager em = new Pracownik().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Pracownik.countPracowniks() {
        return (Long) entityManager().createQuery("select count(o) from Pracownik o").getSingleResult();
    }
    
    public static List<Pracownik> Pracownik.findAllPracowniks() {
        return entityManager().createQuery("select o from Pracownik o").getResultList();
    }
    
    public static Pracownik Pracownik.findPracownik(Long id) {
        if (id == null) return null;
        return entityManager().find(Pracownik.class, id);
    }
    
    public static Pracownik Pracownik.findPracownikByUsername(String username) {
        if (username == null) return null;
        return (Pracownik) entityManager().createQuery("from Pracownik o where username = :username").setParameter("username", username).getSingleResult();
    }
    
    public static List<Pracownik> Pracownik.findPracownikEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Pracownik o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
