package sanchez.arriaga.aitor.monitoractividades;

import java.util.List;

/**
 * Created by goati on 26/02/2017.
 */

public interface UsuarioDao {
    List<UsuarioBean> find(UsuarioBean usuarioBean);

    boolean insert(UsuarioBean usuarioBean);

    boolean delete(UsuarioBean usuarioBean);

    boolean update(UsuarioBean usuarioBean);
}
