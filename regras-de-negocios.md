# Regras de Negócio

1. **Sensores**  
   - Cada sensor deve pertencer a exatamente uma fazenda.  
   - Somente sensores ativos podem gerar leituras.

2. **Leituras**  
   - Leituras são registradas com data/hora e vinculadas a um sensor.  
   - O valor da leitura deve estar dentro do intervalo aceitável para o tipo de sensor.

3. **Fazendas**  
   - Cada fazenda possui um CNPJ único.  
   - Endereço e telefone são obrigatórios para contato.

4. **Plantações**  
   - Cada plantação é iniciada em uma data e terá uma data prevista de coleta.  
   - A largura e altura definem a área plantada.  
   - Cada plantação está associada a exatamente uma cultura.

5. **Culturas**  
   - Tempo de coleta em dias define o ciclo produtivo padrão da cultura.  
   - Nome da cultura deve ser único no sistema.

6. **Insumos**  
   - Cada insumo tem uma unidade de medida única.  
   - Tipo de insumo classifica se é fertilizante, defensivo, etc.

7. **Associação Insumo-Cultura**  
   - Define a quantidade recomendada de cada insumo por cultura.  
   - Pode haver múltiplos insumos associados a uma mesma cultura.

8. **Compras**  
   - Cada compra é feita por uma fazenda e vinculada a um fornecedor.  
   - Valor total é a soma de todos os itens de compra.

9. **Itens de Compra**  
   - Cada item especifica quantidade e valor unitário de um insumo.  
   - Não é permitido incluir o mesmo insumo mais de uma vez num mesmo pedido.

10. **Fornecedores**  
    - Cada fornecedor tem CNPJ e nome únicos.  
    - Contato (e‑mail ou telefone) é obrigatório.

11. **Funcionários**  
    - Funcionários são vinculados a uma fazenda.  
    - CPF e e‑mail devem ser únicos no sistema.  
    - Data de desligamento não pode ser anterior à data de contratação.

12. **Aplicadores**  
    - Aplicadores podem ser contratados por fazenda para executar aplicações.  
    - Tipo de aplicador define sua especialização (e.g. tratorista, técnico).

13. **Aplicação de Insumos**  
    - Toda aplicação registra data, tipo de aplicação e quantidade.  
    - Deve referenciar um insumo, um aplicador e uma plantação válidos.  
    - Quantidade aplicada não pode exceder a recomendação do Insumo_Cultura sem autorização.