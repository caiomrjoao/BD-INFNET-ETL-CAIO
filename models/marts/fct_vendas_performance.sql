{{
    config(
        materialized = 'table'
    )
}}

with silver as (
    select * from {{ ref('int_vendas__enriquecidas') }}
),

agrupado as (
    select
        sk_vendedor,
        faixa_ticket,
        count(distinct id_pedido) as total_pedidos,
        round(sum(valor_total), 2) as receita_total,
        round(sum(valor_imposto), 2) as imposto_total,
        round(sum(lucro_liquido), 2) as lucro_total,
        round(avg(valor_total), 2) as ticket_medio
    from silver
    group by
        sk_vendedor,
        faixa_ticket
)

select * from agrupado