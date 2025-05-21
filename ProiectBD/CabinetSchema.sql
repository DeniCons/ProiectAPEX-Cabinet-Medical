-- Tabela cbGrad
CREATE TABLE cbGrad (
  codGrad VARCHAR2(1) PRIMARY KEY,
  denumire VARCHAR2(50),
  tarif NUMBER(5)
);

-- Tabela cbSpecialitate
CREATE TABLE cbSpecialitate (
  codSpec VARCHAR2(10) PRIMARY KEY,
  denumire VARCHAR2(100),
  coefPlata NUMBER(3,2)
);

-- Tabela cbMedic
CREATE TABLE cbMedic (
  medID VARCHAR2(5) PRIMARY KEY,
  nume VARCHAR2(100),
  codSpec VARCHAR2(10),
  codGrad VARCHAR2(1),
  CONSTRAINT fk_med_spec FOREIGN KEY (codSpec) REFERENCES cbSpecialitate(codSpec),
  CONSTRAINT fk_med_grad FOREIGN KEY (codGrad) REFERENCES cbGrad(codGrad)
);

-- Tabela cbProgramare
CREATE TABLE cbProgramare (
  codPro NUMBER(6) PRIMARY KEY,
  data DATE,
  cnp VARCHAR2(13),
  nume VARCHAR2(100),
  medID VARCHAR2(5),
  cabinet VARCHAR2(10),
  CONSTRAINT fk_prog_med FOREIGN KEY (medID) REFERENCES cbMedic(medID)
);

-- Tabela cbReteta
CREATE TABLE cbReteta (
  codPro NUMBER(6),
  nrItem NUMBER(2),
  medicament VARCHAR2(100),
  doza_zi VARCHAR2(10),
  durata_zile NUMBER(3),
  PRIMARY KEY (codPro, nrItem),
  CONSTRAINT fk_reteta_prog FOREIGN KEY (codPro) REFERENCES cbProgramare(codPro)
);
