package sanchez.arriaga.aitor.monitoractividades;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

/**
 * Created by goati on 29/01/2017.
 */

public class CrearCuentaActivity extends Activity {

    private EditText email;
    private EditText user;
    private EditText password;
    private Button crear;
    private TextView login;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.crearcuenta);

        //Obtenemos una referencia a los controles de la interfaz
        email = (EditText) findViewById(R.id.email);
        user = (EditText) findViewById(R.id.user);
        password = (EditText) findViewById(R.id.password);

        crear = (Button) findViewById(R.id.botonCrearCuenta);
        login = (TextView) findViewById(R.id.botonLoginCrearCuenta);

        //Implementamos el evento click del botón
        crear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Creamos el Intent
                Intent intent =
                        new Intent(CrearCuentaActivity.this, LoginActivity.class);

                UsuarioBean usuarioBean = new UsuarioBean();
                usuarioBean.setUSERNAME(user.getText().toString());
                usuarioBean.setMAIL(email.getText().toString());
                usuarioBean.setPASSWORD(password.getText().toString());
                usuarioBean.setROLES_ID_ROL(2);

                UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl(CrearCuentaActivity.this);
                Boolean reaultado = usuarioDao.insert(usuarioBean);

                //Iniciamos la nueva actividad
                startActivity(intent);
            }
        });

        //Implementamos el evento click del botón
        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Creamos el Intent
                Intent intent =
                        new Intent(CrearCuentaActivity.this, LoginActivity.class);

                //Iniciamos la nueva actividad
                startActivity(intent);
            }
        });

    }

}
