{{
    config(
        materialized = 'view'
    )
}}

with vendas as (
    select * from {{ ref('stg_bq__fato_vendas') }}
),

transformado as (
    select
        id_pedido,
        sk_vendedor,
        sk_produto,
        dataCompra_sk,
        valor_total,
        valor_frete,

        -- 3.2 e 9.2: Variável de Imposto e Indicador Financeiro
        cast(round(valor_total * {{ var('tax_rate', 0.12) }}, 2) as numeric) as valor_imposto,

        -- 9.2: Lucro Líquido com tratamento de nulos
        (coalesce(valor_total, 0) - coalesce(valor_frete, 0)) as lucro_liquido,

        -- 9.1: Segmentação de Negócio (Item 9.1)
        case
            when valor_total >= 500 then 'Ticket Alto'
            when valor_total >= 100 then 'Ticket Médio'
            else 'Ticket Baixo'
        end as faixa_ticket

    from vendas
)

select * from transformado
