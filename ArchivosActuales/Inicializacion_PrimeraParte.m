
function [Puntos,Longitud,Vectores,Angulos,PrimerFrame,UltimoFrame] = ...
    Inicializacion_PrimeraParte(Datos,FrameRHS,FrameRHS2,FrameLHS,FrameLHS2)

%.......................... PUNTOS MARCADORES .............................

%..... PELVIS
%%%% Asis derecha
Puntos.P07 = FiltroPB(Datos.Pasada.Marcadores.Crudos.r_asis,...
    Datos.info.Cinematica.frequency,FrameRHS,FrameLHS2);
[Puntos.P07,PrimerFrame,UltimoFrame] = QuitarNaN(Puntos.P07);

%%%% Asis izquierda
Puntos.P14 = FiltroPB(Datos.Pasada.Marcadores.Crudos.l_asis,...
    Datos.info.Cinematica.frequency,FrameRHS,FrameLHS2);
[Puntos.P14] = QuitarNaN(Puntos.P14);
%%%% Sacro
Puntos.P15 = FiltroPB(Datos.Pasada.Marcadores.Crudos.sacrum,...
    Datos.info.Cinematica.frequency,FrameRHS,FrameLHS2);
[Puntos.P15] = QuitarNaN(Puntos.P15);
%%%% Caderas
Puntos.Articu.CaderaD = zeros(length(Puntos.P07),3);
Puntos.Articu.CaderaI = zeros(length(Puntos.P07),3);

%..... PIERNA DERECHA
%%%% Maleolo Derecho
Puntos.P03 = FiltroPB(Datos.Pasada.Marcadores.Crudos.r_mall,...
    Datos.info.Cinematica.frequency,FrameRHS,FrameRHS2);
[Puntos.P03] = QuitarNaN(Puntos.P03);
%%%% Barra Tibial 2 Derecha
Puntos.P04 = FiltroPB(Datos.Pasada.Marcadores.Crudos.r_bar_2,...
    Datos.info.Cinematica.frequency,FrameRHS,FrameRHS2);
[Puntos.P04] = QuitarNaN(Puntos.P04);
%%%% Epicondilo Derecho
Puntos.P05 = FiltroPB(Datos.Pasada.Marcadores.Crudos.r_knee_1,...
    Datos.info.Cinematica.frequency,FrameRHS,FrameRHS2);
[Puntos.P05] = QuitarNaN(Puntos.P05);
%%%% Barra 1 Muslo
Puntos.P06 = FiltroPB(Datos.Pasada.Marcadores.Crudos.r_bar_1,...
    Datos.info.Cinematica.frequency,FrameRHS,FrameRHS2);
[Puntos.P06] = QuitarNaN(Puntos.P06);
%%%% Rodilla Derecha
Puntos.Articu.RodillaD = zeros(length(Puntos.P07),3);

%..... PIE DERECHO
%%%% Metatarciano Derecho
Puntos.P01 = FiltroPB(Datos.Pasada.Marcadores.Crudos.r_met,...
    Datos.info.Cinematica.frequency,FrameRHS,FrameRHS2);
[Puntos.P01] = QuitarNaN(Puntos.P01);
%%%% Tobillo Derecho
Puntos.P02 = FiltroPB(Datos.Pasada.Marcadores.Crudos.r_heel,...
    Datos.info.Cinematica.frequency,FrameRHS,FrameRHS2);
Puntos.P02 = Puntos.P02(PrimerFrame:UltimoFrame,:);
%%%% Punta y Tobillo Derecho
Puntos.Articu.PuntaD = zeros(length(Puntos.P07),3);
Puntos.Articu.TobilloD = zeros(length(Puntos.P07),3);

%..... PIERNA IZQUIERDA
%%%% Maleolo Izquierdo
Puntos.P10 = FiltroPB(Datos.Pasada.Marcadores.Crudos.l_mall,...
    Datos.info.Cinematica.frequency,FrameLHS,FrameLHS2);
[Puntos.P10] = QuitarNaN(Puntos.P10);
%%%% Barra 2 Tibial Izquierdo
Puntos.P11 = FiltroPB(Datos.Pasada.Marcadores.Crudos.l_bar_2,...
    Datos.info.Cinematica.frequency,FrameLHS,FrameLHS2);
[Puntos.P11] = QuitarNaN(Puntos.P11);
%%%% Epicondilo Izquierdo
Puntos.P12 = FiltroPB(Datos.Pasada.Marcadores.Crudos.l_knee_1,...
    Datos.info.Cinematica.frequency,FrameLHS,FrameLHS2);
[Puntos.P12] = QuitarNaN(Puntos.P12);
%%%% Barra 1 Muslo
Puntos.P13 = FiltroPB(Datos.Pasada.Marcadores.Crudos.l_bar_1,...
    Datos.info.Cinematica.frequency,FrameLHS,FrameLHS2);
[Puntos.P13] = QuitarNaN(Puntos.P13);
%%%% Rodilla Izquierda
Puntos.Articu.RodillaI = zeros(length(Puntos.P07),3);

%..... PIE IZQUIERDO
%%%% Metatarciano Izquierdo
Puntos.P08 = FiltroPB(Datos.Pasada.Marcadores.Crudos.l_met,...
    Datos.info.Cinematica.frequency,FrameLHS,FrameLHS2);
[Puntos.P08] = QuitarNaN(Puntos.P08);
%%%% Tobillo Izquierdo
Puntos.P09 = FiltroPB(Datos.Pasada.Marcadores.Crudos.l_heel,...
    Datos.info.Cinematica.frequency,FrameLHS,FrameLHS2);
[Puntos.P09] = QuitarNaN(Puntos.P09);
%%%% Punta y Tobillo Izquierdo
Puntos.Articu.PuntaI = zeros(length(Puntos.P07),3);
Puntos.Articu.TobilloI = zeros(length(Puntos.P07),3);

%........................... VECTORES UVW .................................

%..... PELVIS
Vectores.U_Pelvis = zeros(length(Puntos.P07),3);
Vectores.V_Pelvis = zeros(length(Puntos.P07),3);
Vectores.W_Pelvis = zeros(length(Puntos.P07),3);

%..... PIERNA DERECHA
Vectores.U_PiernaD = zeros(length(Puntos.P07),3);
Vectores.V_PiernaD = zeros(length(Puntos.P07),3);
Vectores.W_PiernaD = zeros(length(Puntos.P07),3);

%..... PIE DERECHO
Vectores.U_PieD = zeros(length(Puntos.P07),3);
Vectores.V_PieD = zeros(length(Puntos.P07),3);
Vectores.W_PieD = zeros(length(Puntos.P07),3);

%..... PIERNA IZQUIERDA
Vectores.U_PiernaI = zeros(length(Puntos.P07),3);
Vectores.V_PiernaI = zeros(length(Puntos.P07),3);
Vectores.W_PiernaI = zeros(length(Puntos.P07),3);

%..... PIE IZQUIERDO
Vectores.U_PieI = zeros(length(Puntos.P07),3);
Vectores.V_PieI = zeros(length(Puntos.P07),3);
Vectores.W_PieI = zeros(length(Puntos.P07),3);

%........................... VECTORES IJK .................................

Vectores.I_MusloD = zeros(length(Puntos.P07),3);
Vectores.J_MusloD = zeros(length(Puntos.P07),3);
Vectores.K_MusloD = zeros(length(Puntos.P07),3);

Vectores.I_PiernaD = zeros(length(Puntos.P07),3);
Vectores.J_PiernaD = zeros(length(Puntos.P07),3);
Vectores.K_PiernaD = zeros(length(Puntos.P07),3);

Vectores.I_PieD = zeros(length(Puntos.P07),3);
Vectores.J_PieD = zeros(length(Puntos.P07),3);
Vectores.K_PieD = zeros(length(Puntos.P07),3);

%...................... LONGITUDES ANTROPOMETRICAS ........................

Longitud.A01 = Datos.antropometria.children.PESO.info.values;
Longitud.A02 = Datos.antropometria.children.LONGITUD_ASIS.info.values*0.01;
Longitud.A07 = Datos.antropometria.children.LONGITUD_PIERNA_DERECHA.info.values*0.01;
Longitud.A08 = Datos.antropometria.children.LONGITUD_PIERNA_IZQUIERDA.info.values*0.01;
Longitud.A11 = Datos.antropometria.children.DIAMETRO_RODILLA_DERECHA.info.values*0.01;
Longitud.A12 = Datos.antropometria.children.DIAMETRO_RODILLA_IZQUIERDA.info.values*0.01;
Longitud.A13 = Datos.antropometria.children.LONGITUD_PIE_DERECHO.info.values*0.01;
Longitud.A14 = Datos.antropometria.children.LONGITUD_PIE_IZQUIERDO.info.values*0.01;
Longitud.A15 = Datos.antropometria.children.ALTURA_MALEOLOS_DERECHO.info.values*0.01;
Longitud.A16 = Datos.antropometria.children.ALTURA_MALEOLOS_IZQUIERDO.info.values*0.01;
Longitud.A17 = Datos.antropometria.children.ANCHO_MALEOLOS_DERECHO.info.values*0.01;
Longitud.A18 = Datos.antropometria.children.ANCHO_MALEOLOS_IZQUIERDO.info.values*0.01;
Longitud.A19 = Datos.antropometria.children.ANCHO_PIE_DERECHO.info.values*0.01;
Longitud.A20 = Datos.antropometria.children.ANCHO_PIE_IZQUIERDO.info.values*0.01;

%............................. CENTROS DE MASA ............................

%...................MUSLO DERECHO
Puntos.CM.MusloD = zeros(length(Puntos.P07),3);

%...................MUSLO IZQUIERDO
Puntos.CM.MusloI = zeros(length(Puntos.P07),3);

%...................PANTORRILLA DERECHA
Puntos.CM.PantorrillaD = zeros(length(Puntos.P07),3);

%...................PANTORRILLA IZQUIERDA
Puntos.CM.PantorrillaI = zeros(length(Puntos.P07),3);

%...................PIE DERECHO
Puntos.CM.PieD = zeros(length(Puntos.P07),3);

%...................PIE IZQUIERDO
Puntos.CM.PieI = zeros(length(Puntos.P07),3);

%............................. ANGULOS ............................

%............... Muslo y Pelvis  
Angulos.Alfa_HJC_D = zeros(length(Puntos.P07),1);
Angulos.Beta_HJC_D = zeros(length(Puntos.P07),1);
Angulos.Gamma_HJC_D = zeros(length(Puntos.P07),1);
Angulos.Alfa_HJC_I = zeros(length(Puntos.P07),1);
Angulos.Beta_HJC_I = zeros(length(Puntos.P07),1);
Angulos.Gamma_HJC_I = zeros(length(Puntos.P07),1);

%................ Piernas
Angulos.Alfa_KJC_D = zeros(length(Puntos.P07),1);
Angulos.Gamma_KJC_D = zeros(length(Puntos.P07),1);
Angulos.Alfa_KJC_I = zeros(length(Puntos.P07),1);
Angulos.Beta_KJC_I = zeros(length(Puntos.P07),1);
Angulos.Gamma_KJC_I = zeros(length(Puntos.P07),1);

%................ Pies
Angulos.Alfa_AJC_D = zeros(length(Puntos.P07),1);
Angulos.Beta_AJC_D = zeros(length(Puntos.P07),1);
Angulos.Gamma_AJC_D = zeros(length(Puntos.P07),1);
Angulos.Alfa_AJC_I = zeros(length(Puntos.P07),1);
Angulos.Beta_AJC_I = zeros(length(Puntos.P07),1);
Angulos.Gamma_AJC_I = zeros(length(Puntos.P07),1);

end


