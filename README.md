# FarmTech Solutions — Modelagem de Banco de Dados

### Regras de negócios
[Regras de negócios](./regras-de-negocios.md)

---

### DER modelo lógico e relacional

- [DER: Modelo Lógico](./modelo-logico.png)

- [DER: Modelo Relacional](./modelo-relacional.png)

### MER

# Modelo Entidade‑Relacionamento (MER)


uma Fazenda PODE possuir VARIOS Sensores  
um Sensor DEVE pertencer a UMA Fazenda  

**Cardinalidade Fazenda**: 0:N  
**Cardinalidade Sensor**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

um Sensor PODE gerar VARIAS Leituras  
uma Leitura DEVE pertencer a UM Sensor  

**Cardinalidade Sensor**: 0:N  
**Cardinalidade Leitura**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

uma Fazenda PODE ter VARIAS Plantações  
uma Plantação DEVE pertencer a UMA Fazenda  

**Cardinalidade Fazenda**: 0:N  
**Cardinalidade Plantação**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

uma Plantação DEVE ter UMA Cultura  
uma Cultura PODE estar em VARIAS Plantações  

**Cardinalidade Plantação**: 1:1  
**Cardinalidade Cultura**: 0:N  
**Cardinalidade Relacionamento**: 1:N  

---

uma Cultura PODE requerer VARIOS Insumos  
um Insumo PODE ser usado em VARIAS Culturas  

**Cardinalidade Cultura**: 0:N  
**Cardinalidade Insumo**: 0:N  
**Cardinalidade Relacionamento**: N:M  

---

uma Unidade_de_Medida PODE associar‑se a VARIOS Insumos  
um Insumo DEVE ter UMA Unidade_de_Medida  

**Cardinalidade Unidade_de_Medida**: 0:N  
**Cardinalidade Insumo**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

uma Fazenda PODE realizar VARIAS Compras  
uma Compra DEVE pertencer a UMA Fazenda  

**Cardinalidade Fazenda**: 0:N  
**Cardinalidade Compra**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

um Fornecedor PODE receber VARIAS Compras  
uma Compra DEVE ser feita a UM Fornecedor  

**Cardinalidade Fornecedor**: 0:N  
**Cardinalidade Compra**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

uma Compra DEVE conter PELO MENOS 1 Item_de_Compra  
um Item_de_Compra DEVE pertencer a UMA Compra  

**Cardinalidade Compra**: 1:N  
**Cardinalidade Item_de_Compra**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

um Insumo PODE aparecer em VARIOS Itens_de_Compra  
um Item_de_Compra DEVE referenciar UM Insumo  

**Cardinalidade Insumo**: 0:N  
**Cardinalidade Item_de_Compra**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

uma Fazenda PODE empregar VARIOS Funcionários  
um Funcionário DEVE pertencer a UMA Fazenda  

**Cardinalidade Fazenda**: 0:N  
**Cardinalidade Funcionário**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

uma Fazenda PODE ter VARIOS Aplicadores  
um Aplicador DEVE pertencer a UMA Fazenda  

**Cardinalidade Fazenda**: 0:N  
**Cardinalidade Aplicador**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

um Insumo PODE receber VARIAS Aplicações_de_Insumo  
uma Aplicação_de_Insumo DEVE referenciar UM Insumo  

**Cardinalidade Insumo**: 0:N  
**Cardinalidade Aplicação_de_Insumo**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

um Aplicador PODE executar VARIAS Aplicações_de_Insumo  
uma Aplicação_de_Insumo DEVE ser realizada por UM Aplicador  

**Cardinalidade Aplicador**: 0:N  
**Cardinalidade Aplicação_de_Insumo**: 1:1  
**Cardinalidade Relacionamento**: 1:N  

---

uma Plantação PODE receber VARIAS Aplicações_de_Insumo  
uma Aplicação_de_Insumo DEVE destinar‑se a UMA Plantação  

**Cardinalidade Plantação**: 0:N  
**Cardinalidade Aplicação_de_Insumo**: 1:1  
**Cardinalidade Relacionamento**: 1:N  