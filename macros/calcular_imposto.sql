{#
  =============================================================================
  Macro: calcular_imposto
  Descrição: Aplica uma alíquota percentual de imposto sobre a receita bruta.
  Parâmetros:
    - valor_total: Coluna ou expressão com o montante financeiro da venda.
    - aliquota: Taxa percentual (padrão obtido da variável global 'tax_rate').
  Retorno: Expressão SQL arredondada para 2 casas decimais do tipo NUMERIC.
  =============================================================================
#}

{% macro calcular_imposto(valor_total, aliquota=var('tax_rate', 0.12)) %}
    cast(round({{ valor_total }} * {{ aliquota }}, 2) as numeric)
{% endmacro %}